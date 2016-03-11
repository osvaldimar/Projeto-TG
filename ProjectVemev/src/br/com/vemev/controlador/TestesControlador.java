package br.com.vemev.controlador;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.vemev.dao.CelulaDAO;
import br.com.vemev.modelo.Celula;

@Controller
public class TestesControlador {
	
	@RequestMapping(value={"/teste/celula"})
	public void testes(HttpServletRequest request, HttpServletResponse response){
				
		CelulaDAO dao = new CelulaDAO();

		//celulas
		Celula cel1 = new Celula();
		cel1.setNome_celula("Celula 1");
		cel1.setId_setor(1);
		cel1.setTotal(6);
		cel1.setEndereco("Rua celula 1");

		Celula cel2 = new Celula();
		cel2.setNome_celula("Celula 2");
		cel2.setId_setor(1);
		cel2.setTotal(12);
		cel2.setEndereco("Rua celula 2");
		
		//create
		dao.create(cel1);
		dao.create(cel2);
		
		//read
		//Celula celula = dao.read("Celula 2");

		//update
		//celula.setTotal(10);
		//celula.setNome_celula("celula 2 update");
		//dao.update(celula, "Celula 2");
		
		
		//lista
		ArrayList<Celula> lista = dao.getLista();
		
		//delete
		//dao.delete("Celula 1");
		
		
		
	}

}
