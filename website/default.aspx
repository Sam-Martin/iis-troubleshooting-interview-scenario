<!-- directives -->
<% @Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!-- code section -->
<script runat="server">
   private void convertoupper(object sender, EventArgs e)
   {
      var con = ConfigurationManager.ConnectionStrings["MyConnection"].ToString();

      string result ="";
      using (SqlConnection myConnection = new SqlConnection(con))
      {
          string oString = "Select * from Test";
          SqlCommand oCmd = new SqlCommand(oString, myConnection);    
          myConnection.Open();
          using (SqlDataReader oReader = oCmd.ExecuteReader())
          {
              while (oReader.Read())
              {    
                  result = oReader["x"].ToString();

              }

              myConnection.Close();
          }               
      }
      changed_text.InnerHtml = result;
   }
  
</script>

<!-- Layout -->
<html>
   <head> 
      <title> Get Number From Database </title> 
   </head>
   
   <body>
      <h3> Get Number From Database </h3>
      
      <form runat="server">
         <input runat="server" id="button1" type="submit" value="Enter..." OnServerClick="convertoupper"/>
         
         <hr />
         <h3> Results: </h3>
         <span runat="server" id="changed_text" />
      </form>
      
   </body>
   
</html>