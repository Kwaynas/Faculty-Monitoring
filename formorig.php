 <!DOCTYPE html>
 <HTML>
 <HEAD>
 <title>Meeting Request Form</title>
	 <LINK rel="icon" type="image/x-icon" href="favicon.ico">
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
 <FORM action="submitted.html" method="post">
 <BR><BR><BR>
  <h2>Meeting Request Form</h2>
     
    <div><LABEL for="name">Student Name: </LABEL>
    <INPUT type="text" name="name" placeholder="Dela Cruz, Juan H." required>*</div><BR>
    <div><LABEL for="number">Student Number: </LABEL>
    <INPUT type="text" name="number" placeholder="20xxxxxxxx" pattern="[0-9]{10}" title="Please enter a valid student number." required>*</div><BR>
	
	<div><LABEL for="subjsec">Course/Section: </LABEL>
    <INPUT type="text" name="subjsec" placeholder="ECEA120D/E02"></div><BR>
	
    <div><LABEL for="email">School Email: </LABEL>
    <INPUT type="text" name="email" placeholder="jhdelacruz@mymail.mapua.edu.ph" pattern="[a-z]+@[a-z]+.[a-z]+.[a-z]+.[a-z]{2,}$" title="Insert Mapúa Email" style="text-transform:lowercase" required>*</div><BR>
	<div><LABEL for="purpose">Purpose of Visit: </label>
	<SELECT name="purpose" id="purpose" required>
	  <OPTION value="">-----Select-----</OPTION>
	  <OPTION value="Grade Verification">Grade Verification</OPTION>
	  <OPTION value="Research Consultation">Research Consultation</OPTION>
	  <OPTION value="Inquiry">Inquiry</OPTION>
	  <OPTION value="Make-up Exam">Make-up Exam</OPTION>
	  <OPTION value="Others">Others</OPTION>
	</SELECT>*</div><BR>
	<div><LABEL for="propdate">Proposed Date:</LABEL>
	<input type="date" name="propdate" min="2050-01-01" onfocus="this.min=new Date().toISOString().split('T')[0]" />*</div><br>
	<div><LABEL for="proptimestart">Proposed Starting Time:</LABEL>
	<input type="time" name="proptimestart" value="07:30">*</div><BR>
	<div><LABEL for="proptimeend">Proposed Ending Time:</LABEL>
	<input type="time" name="proptimeend" value="07:30">*</div><BR>
    <div><LABEL for="faculty">Faculty:</label>
	<select name="faculty" id="faculty" required>
		<option value="">-----Select-----</option>
		
	</select>*</div><BR>
	<div><label for="stdmsg">Message for Professor:</label></div>
	<div><textarea id="stdmsg" name="stdmsg" rows="4" cols="50" maxlength=200 placeholder="Max 200 characters."></textarea></div>
	<div><p style="color:red"><small>*Required</small></p></div><br>
	<div><INPUT type="submit" value="Send Request"> <INPUT type="reset"></div><br>
	
 </FORM>

 </BODY>
 </HTML>
