/* javascript para os submenus do bootstrap */

$(document).ready(function() {
        $("#btn-liderSetor").mouseover(function() {
			$("#menu-liderSetor").css("display", "block");
		});
		$("#btn-liderSetor").mouseleave(function() {
			$("#menu-liderSetor").css("display", "none");
		});
		
		$("#btn-liderRede").mouseover(function() {
			$("#menu-liderRede").css("display", "block");
		});
		$("#btn-liderRede").mouseleave(function() {
			$("#menu-liderRede").css("display", "none");
			
			
			});
			
	     $("#btn-liderCelula").mouseover(function() {
			$("#menu-liderCelula").css("display", "block");
		});
		$("#btn-liderCelula").mouseleave(function() {
			$("#menu-liderCelula").css("display", "none");
		});
		
		
		  $("#btn-liderTreinamento").mouseover(function() {
			$("#menu-liderTreinamento").css("display", "block");
		});
		$("#btn-liderTreinamento").mouseleave(function() {
			$("#menu-liderTreinamento").css("display", "none");
		});
    });