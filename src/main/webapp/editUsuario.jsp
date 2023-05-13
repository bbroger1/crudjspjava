<%@page import="com.crudjspjava.dao.UsuarioDao"%>
<jsp:useBean id="u" class="com.crudjspjava.bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u" />


<%
	int i = UsuarioDao.updateUsuario(u);
	if(i != 1){
		response.sendRedirect("editForm.jsp");
	}
	
	response.sendRedirect("viewUsuarios.jsp");
%>