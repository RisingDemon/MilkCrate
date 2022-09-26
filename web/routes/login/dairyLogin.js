import { initializeApp } from 'firebase/app';
import { getAuth, signInWithEmailAndPassword} from 'firebase/auth';
import * as dotenv from 'dotenv';
dotenv.config();
const dairyLogin =(request, response)=>{
    // console.log(request.body);
    const {ownerEmail,ownerPassword}=request.body;

     
    // firebase config
    // For Firebase JS SDK v7.20.0 and later, measurementId is optional   
    const firebaseConfig = process.env.API_KEYS;
    const firebaseApp=initializeApp(firebaseConfig);
    const auth = getAuth(firebaseApp);
    const email = ownerEmail;
    const password = ownerPassword;



    // SignUp code
    signInWithEmailAndPassword(auth, email, password)
    .then((userCredential) => {
    // Signed in 
     const user = userCredential.user;
      return response.send({
      status: "success",
      code: 200,
      data: {
        uid: user.uid,
        email:user.email,
      },
      });
     
     
     })
    .catch((error) => {
    const errorCode = error.code;
    const errorMessage = error.message;
    
    //This send the responce for invalid credentials 
    if(errorMessage==="Firebase: Error (auth/wrong-password).")
    {
      return response.send({
        status: "failure",
        message: "Invalid Email Or Password!!!!",
        code: 400,
      });
    }

    else if(errorMessage==="Firebase: Error (auth/user-not-found)."){
      return response.send({
        status: "failure",
        message: "User does not exit!! Please SignUp",
        code: 400,
      });
      
    }

    else{
      return response.send({
        status: "failure",
        message: "Something went wrong!!",
        code: 500,
      });

    }
    
    });


    // loginWithFirebase(email,password);


   
};
// async function loginWithFirebase(auth,email,password){
//         try{
//             const result = await signInWithEmailAndPassword(auth,email,password);
//             console.log(result.user);
//         }catch(err){
//             console.log(err)
//             // M.toast({html: err.message,classes:"red"})
//         }
// } 

export{dairyLogin};