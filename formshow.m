function html=formshow(headers,config)
html = '<!DOCTYPE html>';
html=[html '<html><head> <STYLE>h2 {text-align: center; font-family: Gill Sans, sans-serif;} div {text-align: center; font-family: Gill Sans, sans-serif;} label {display: inline-block; width: 120px; text-align: right; font-family: Gill Sans, sans-serif;} table, td {border: 1px solid black; border-collapse: collapse;} table.center {margin-left: auto; margin-right: auto;} </STYLE></head>'];
html=[html char("<body><br><br><h2>Meeting Request Submitted!</h2><div>Please wait for your professor's acknowledgement.</div><div>The final meeting details will be sent to your email.</div>")];
html=[html '<br><div>Submission summary:</div><br>'];
html=[html '<div><table class="center">'];
ContentForm=headers.Content;
fn=fieldnames(ContentForm);
for i=1:length(fn)
    switch fn{i}
        case 'name'
            lab = 'Student Name: ';
        case 'number'
            lab = 'Student Number: ';
        case 'email'
            lab = 'Email Address: ';
        case 'purpose'
            lab = 'Purpose of Request: ';
        case 'propdate'
            lab = 'Proposed Date: ';
        case 'proptimestart'
            lab = 'Proposed Starting Time: ';
        case 'proptimeend'
            lab = 'Proposed Ending Time: ';
        case 'faculty'
            lab = 'Professor: ';
    end
	html=[html '<tbody><tr><td>' lab '</td><td>' ContentForm.(fn{i}) '</td></tbody></tr>'];
end
html=[html '</table></div><br><br><div><a href="form.php">Back to Previous Page</a></div><br></body></html>'];

 