///////////////
/// READ
///////////////

function ucitaj(){
	$.getJSON(putanjaAPI + "/read", function( jsonData ) {
		postaviNaTablicu(jsonData);
	});
}

ucitaj();


///////////////
/// CREATE
///////////////
$("#noviKolegij").click(function(){
	jQuery.each($("#forma").serializeArray(), function() {
		$("#" + this.name).val(""); //ovaj val("") služi da isprazni polja u modalu kad kreiramo novi, a ne da ispuni s podatcima koje bi izlistao
    });
    $("#sifra").val("0"); //0 je indikacija da se radi o novom, jer svi ostali koji postoje imaju neki broj
	$('#modal').modal('show');  		
	return false;
});


///////////////
/// UPDATE
///////////////

$("#spremi").click(function(){
    var json = {};
    jQuery.each($("#forma").serializeArray(), function() {
        json[this.name] = this.value || '';
    });
	if(json["sifra"]=="0"){ //ako je šifra 0 onda zove putanju create, a ako nije 0 onda update
		delete json.sifra;  //briše 0 jer backedna API kod create ne očekuje šifru, očekuje samo ime, prezime...
		ajax(putanjaAPI + "/create",json);
	}else{
		ajax(putanjaAPI + "/update",json);
	}
	return false;
});


///////////////
/// SEARCH
///////////////

$("#traziForma").submit(function( event ) {
	trazi();
	return false;
});


$("#uvjet").keyup(function( event ) {
	trazi();
	return false;
});



//Ova funkcija je potrebna kako bi nakon ajax-a mogli na novo učitane redove definirati događaje
function definirajDogadajeNakonAJAXa(){
	
	///////////////
  	/// DELETE
  	///////////////
	
	$(".brisanje").click(function(){
	    var json = {};
	    json["sifra"]=$(this).attr("id").split("_")[1];
		if(confirm("sigurno obrisati?")){
			ajax(putanjaAPI + "/delete",json);
		}
		return false;
	});
	
	///////////////
  	/// UPDATE
  	///////////////
	
	$(".promjena").click(function(){
		var sifra=$(this).attr("id").split("_")[1]; 
		$.getJSON(putanjaAPI + "/read/" + sifra, function( jsonData ) { //dohvaća sve sa servera 
			//console.log(jsonData);
			//console.log(Object.entries(jsonData));
			jQuery.each(Object.entries(jsonData), function() {
				$("#" + this[0]).val(this[1]);
			});
			$('#modal').modal('show');	  			//prikazuje podatke sa servera
		});
	});
}





///////////////
/// UTILITY
///////////////

function ajax(putanja,json){
	var podaci=JSON.stringify(json);
	$.ajax({
		type: 'POST',
	    url: putanja,
	    contentType: 'application/json; charset=utf-8',
	    data: JSON.stringify(json),
	    success: function(data){
	        if(data==="OK"){
	        	ucitaj();
	        	$('#modal').modal('hide');
	        }
	    }
	});
}

function postaviNaTablicu(jsonData){
	$("#podaci").html("");
	  $.each( jsonData, function( kljuc, kolegij ) {
	    $("#podaci").append("<tr>" + 
	    "<td>" + kolegij.sifra + "</td>" +
	    "<td>" + kolegij.naziv + "</td>" +
	    "<td>" + kolegij.ects + "</td>" +
	    "<td><a href=\"#\" class=\"promjena\" id=\"o_" + kolegij.sifra + "\">Promjena</a> | " +
	    "<a href=\"#\" class=\"brisanje\" id=\"o_" + kolegij.sifra + "\">Brisanje</a>"
	     + "</td>" +
	    "</tr>");
	  });
	  definirajDogadajeNakonAJAXa();
}


function trazi(){
	var uvjet=$("#uvjet").val();
	if(uvjet==""){
		uvjet="%20";
	}
	$.getJSON(putanjaAPI + "/search/" + uvjet, function( jsonData ) {
		postaviNaTablicu(jsonData);
	});
}