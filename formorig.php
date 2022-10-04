 <!DOCTYPE html>
 <HTML>
 <HEAD>
 <STYLE>
 h2 {
	text-align: center;
	font-family: Gill Sans, sans-serif;}
 div {
		font-family: Gill Sans, sans-serif;
		text-align: center;
      }
 label {
		font-family: Gill Sans, sans-serif;
        display: inline-block;
        text-align: right;
      }
	  
 </STYLE>
 </HEAD>
 <BODY>
 <div></div>
 <FORM action="formshow.m" method="post">
 <BR><BR><BR>
  <h2>Meeting Request Form</h2>
     
    <div><LABEL for="name">Student Name: </LABEL>
    <INPUT type="text" name="name" required></div><BR>
    <div><LABEL for="number">Student Number: </LABEL>
    <INPUT type="text" name="number" pattern="[0-9]{10}" title="Please enter a valid student number." required></div><BR>
    <div><LABEL for="email">School Email: </LABEL>
    <INPUT type="text" name="email" pattern="[a-z]+@[a-z]+.[a-z]+.[a-z]+.[a-z]{2,}$" title="Insert Mapúa Email" style="text-transform:lowercase" required></div><BR>
	<div><LABEL for="purpose">Purpose of Visit: </label>
	<SELECT name="purpose" id="purpose" required>
	  <OPTION value="">-----Select-----</OPTION>
	  <OPTION value="Grade Verification">Grades</OPTION>
	  <OPTION value="Research Consultation">Consultation</OPTION>
	  <OPTION value="Inquiry">Inquiry</OPTION>
	  <OPTION value="Make-up Exam">Make-up Exam</OPTION>
	  <OPTION value="Others">Others</OPTION>
	</SELECT></div><BR>
	<div><LABEL for="propdate">Proposed Date:</LABEL>
	<input type="date" name="propdate" min="2050-01-01" onfocus="this.min=new Date().toISOString().split('T')[0]" /></div><br>
	<div><LABEL for="proptimestart">Proposed Starting Time:</LABEL>
	<input type="time" name="proptimestart" value="07:30"></div><BR>
	<div><LABEL for="proptimeend">Proposed Ending Time:</LABEL>
	<input type="time" name="proptimeend" value="07:30"></div><BR>
    <div><LABEL for="faculty">Faculty:</label>
	<select name="faculty" id="faculty" required>
		<option value="">-----Select-----</option>
		
	</select></div><BR>
	<div><INPUT type="submit" value="Send Request"> <INPUT type="reset"></div><br>
	
 </FORM>

 </BODY>
 </HTML>
