/**
 * 
 */

 
			 	let name = sessionStorage.getItem("이름");
                    let email1 = sessionStorage.getItem("메일1");
                    let email2 = sessionStorage.getItem("메일2");
                   let phone1 = sessionStorage.getItem("번호1");
                   let phone2 = sessionStorage.getItem("번호2");
                   let phone3 = sessionStorage.getItem("번호3");
            
          
           
            
            $('input[name=inputName]').attr('value',name);
            $('input[name=inputEmail1]').attr('value',email1);
            $('input[name=inputEmail2]').attr('value',email2);
            $('input[name=inputPhone1]').attr('value',phone1);
            $('input[name=inputPhone2]').attr('value',phone2);
            $('input[name=inputPhone3]').attr('value',phone3);
          
          
          	