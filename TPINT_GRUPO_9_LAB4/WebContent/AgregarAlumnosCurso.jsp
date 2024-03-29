<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Entidades.Alumno" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js%22%3E"></script>

<style>
		th {
            text-align: center !important;
        }
        .custom-select {
        	position: absolute !important;
            left: 2%;
        }
        body>div {
            box-shadow: 10px 10px 8px #888888;
            border: 2px solid black;
            border-radius: 10px;
        }
</style>

<title>Cursos</title>
</head>
<body>

<center>
<form action="servletInternoCursos" method="get" style="border: 1px solid #000000; width: 50%; border-radius: 15px; margin-top: 20px; box-shadow: 0px 0px 10px 0px #000000; padding: 15px; background-color: #A1EE9F" >
	
<%
if(session.getAttribute("usuarioLogueado")==null)
{
	String redirectURL = "http://localhost:8080/Maquina_Virtual/Login.jsp";
	response.sendRedirect(redirectURL);
}
%>
	
	<h1><b>Agregar Curso</b></h1>
	<br>
	<%
		ArrayList<Alumno> Lista = null;
		if (request.getAttribute("ListaAlumnosCurso")!=null) 
		{
			Lista = (ArrayList<Alumno>)request.getAttribute("ListaAlumnosCurso");
		}
	%>
	
	<%
		if(Lista!=null){
	%>
	<table id="tablax" class="tabla-alumnos" border="1" border-color="black">
	<thead align="center">
		<tr style="background-color: #002060; color: #ffffff; text-shadow: #808080 1.5px 1px; padding: 1px;">
			<th align="center"><input id="select_all" type="checkbox" name="chkTodos" value="Todos"></th>
			<th align="center">Legajo</th>
			<th align="center">DNI</th>
			<th align="center">Nombre y Apellido</th>
		</tr>
	</thead>
	<tbody>
		<%
			for(Alumno a : Lista){
			session.setAttribute("listadoAlumnosCurso", Lista);
		%>
		<tr style="background-color: LightBlue; color: Black;">
			<td align="center">
				<input type="checkbox" class="checkbox" name="chk<%=a.getID()%>" value="<%=a.getID()%>">
			</td>
			<td align="center">
				<%=a.getLegajo()%>
			</td>
			<td align="center">
				<%=a.getDNI()%>
			</td>
			<td align="center">
				<%=a.getNombre()+" "+a.getApellido()%>
			</td>
		</tr>
		<%} %>
	</tbody>
	</table>
	<%} %>
	
	<br>
	
			<center>
				<% 
					if(request.getAttribute("mensajeCurso")!=null){ 
						if(request.getAttribute("mensajeCurso")=="Curso y alumno/s agregados correctamente.")
						{%>
							<label Style="color: darkgreen; box-shadow: 0px 0px 10px 0px #000000; padding: 4px; background-color: #ffffff; border-radius: 15px;">
								<b><%=request.getAttribute("mensajeCurso") %></b>
							</label>
						<%} 
						else
						{%>
							<label Style="color: red; box-shadow: 0px 0px 10px 0px #000000; padding: 4px; background-color: #ffffff; border-radius: 15px;">
								<b><%=request.getAttribute("mensajeCurso") %></b>
							</label>
						<%} %>
						
					<%}
				%>
			</center>
	
	<br>
	<input type="submit" name="btnConfirmarAlumnosCurso" value="Confirmar" OnClick="return confirm('¿Confirma agregar el curso?');" style="border: 2px solid #3C67E2; background-color: #20FFD0; box-shadow: 0px 0px 10px 0px #000000; border-radius: 15px; font-weight: 400; font-size: 18px; padding-top: 3px; padding-bottom: 3px;padding-inline: 3px;">
	<br><br><br>
	<input type="submit" name="btnVolverAgregarCurso" value="Volver" OnClick="return confirm('¿Si cancela ahora, no se agregará el curso, seguro?');" style="border: 2px solid #797777; background-color: #F3E276; box-shadow: 0px 0px 10px 0px #000000; border-radius: 15px; font-weight: 400; font-size: 18px; padding-top: 3px; padding-bottom: 3px;padding-inline: 3px; margin-left: 80%;">
	
</form>
</center>
<br>
<label style="margin-left: 38%;">Usuario Logueado: <b><%=session.getAttribute("usuarioLogueado") %></b></label>

<script src="https://code.jquery.com/jquery-3.6.0.min.js%22%3E"></script>

<script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
    <!-- DATATABLES -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
    </script>
    <!-- BOOTSTRAP -->
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
    </script>
    <script>
        $(document).ready(function () {
            $('#tablax').DataTable({
                language: {
                    processing: "Tratamiento en curso...",
                    search: "Filtrar&nbsp;:",
                    lengthMenu: "_MENU_",
                    info: "Mostrando del _START_ al _END_ de un total de _TOTAL_ alumnos",
                    infoEmpty: "",
                    infoFiltered: "",
                    infoPostFix: "",
                    loadingRecords: "Cargando...",
                    zeroRecords: "No se encontraron alumnos que coincidan con tu búsqueda",
                    emptyTable: "No hay alumnos disponibles para este curso.",
                    paginate: {
                        first: "Primero",
                        previous: "Anterior",
                        next: "Siguiente",
                        last: "Ultimo"
                    },
                    aria: {
                        sortAscending: ": active para ordenar la columna en orden ascendente",
                        sortDescending: ": active para ordenar la columna en orden descendente"
                    }
                },
                scrollY: 200,
                lengthMenu: [ [5, 10, 40,  -1], [5, 10, 40, "All"] ],
            });
        });
    </script>

<script type="text/javascript">
$(document).ready(function(){
    $('#select_all').on('click',function(){
        if(this.checked){
            $('.checkbox').each(function(){
                this.checked = true;
            });
        }else{
             $('.checkbox').each(function(){
                this.checked = false;
            });
        }
    });

    $('.checkbox').on('click',function(){
        if($('.checkbox:checked').length == $('.checkbox').length){
            $('#select_all').prop('checked',true);
        }else{
            $('#select_all').prop('checked',false);
        }
    });
});
</script>

</body>
</html>