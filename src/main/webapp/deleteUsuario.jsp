<%@page import="com.crudjspjava.dao.UsuarioDao"%>
<jsp:useBean id="u" class="com.crudjspjava.bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u" />


<%
	int i = UsuarioDao.excluirUsuario(u);
	
	if(i != 1) {
		response.sendRedirect("viewUsuarios.jsp");
	}
	
	response.sendRedirect("viewUsuarios.jsp");
%>