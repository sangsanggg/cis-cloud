<%--<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page import="javax.ws.rs.GET" %>
<%@ page import="javax.ws.rs.Path" %>
<%@ page import="javax.ws.rs.PathParam" %>
<%@ page import="javax.ws.rs.Produces" %>
<%@ page import="javax.ws.rs.core.MediaType" %>
<%@ page import="javax.json.Json" %>
<%@ page import="javax.json.JsonObject" %>
<%@ page import="javax.json.JsonObjectBuilder" %>

<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>

<%@ page import="java.io.IOException" %>

<%@ page import="javax.json.JsonBuilderFactory" %>
<%@ page import="javax.json.JsonObjectBuilder" %>

<%@ page import="javax.json.Json" %>
<%@ page import="javax.json.JsonObject" %>

<%@ page import="java.io.PrintWriter" %>
<%
@WebServlet(urlPatterns = {"/api/*"})
class MyAPI extends HttpServlet {
  @GET
  @Path("/users/{id}")
  @Produces(MediaType.APPLICATION_JSON)
  public void getUser(@PathParam("id") int id, HttpServletRequest request, HttpServletResponse response) throws IOException {
    // Retrieve the user from the database
    User user = getUserById(id);

    // Build the JSON response object
    JsonObjectBuilder builder = Json.createObjectBuilder();
    builder.add("id", user.getId())
           .add("name", user.getName())
           .add("email", user.getEmail());
    JsonObject json = builder.build();

    // Write the JSON response to the response body
    response.setContentType("application/json");
    PrintWriter writer = response.getWriter();
    writer.write(json.toString());
    writer.flush();
  }
}
%>--%>
