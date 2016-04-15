
	//funcao para mostrar o relatorio do membro em pop up
	function mostrarRelatorioMembroPopup(id){
		$.get("/vemev/membro/ajaxRelatorioDadosMembro",
		    {
		        id_membro: id		//parametro
		    },
		    function(data, status){
		        //pop up com detalhes do membro
		        $.magnificPopup.open({
		            items: {
		                src: data,
		                type:'inline'
		            },
		            modal: true
		        });
		    }
		);
	}
	
	//maginific-poup
	$(document).ready(function() {
		$('.popup-with-form').magnificPopup({
			type: 'inline',
			preloader: false,	
		});
		$('.ajax-popup-link').magnificPopup({
			  type: 'ajax'
			});
	})
	
	function closePopup(){
	  var magnificPopup = $.magnificPopup.instance; 
	  magnificPopup.close(); 
	}