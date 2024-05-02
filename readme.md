# Manual set-up
1. Write up an index.html for login and log out files
2. Install python3 and run the below command:
   py -m http.server
3. Create up a Cognito with Sign-in experience that is enabling MFA for the users of the cognito user pools.
4. Give the callback url as a host url when enabling sign-in as an example below:
   https://example.com/8000
5. Host the application where you see signin username and password and then it asks the MFA code to the selected configuration to email, phone numbers,etc...   
6. Reference video for the above steps:
https://www.youtube.com/watch?v=8a0vtkWJIA4

# Template set-up
Reference documentation:
https://www.thelambdablog.com/creating-an-aws-cognito-user-pool-and-client-for-managing-authentication/
https://stackoverflow.com/questions/75315968/cognito-passwordless-flow-with-username-and-email-as-aliasattribute


# Terraform-setup
1. Create a terraform folder and with main.tf, variables.tf,terraform.tfvars and version.tf.
2. Run below commands:
   > terraform init
   > terraform plan
   > terraform apply -auto-approve
3. And a sample html files(index.html, logged_in.html, logged_out.html) for login page routing to Signin page.
4. Run the below command for login page
   > py -m http.server   
       
