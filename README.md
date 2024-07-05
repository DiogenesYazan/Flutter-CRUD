# FlutterCRUD



## Esse é um CRUD usando Flutter e Firebase.

Esse projeto foi desenvolvido com um pouco do conhecimento que estou tendo ao aprender sobre flutter, falta ainda muito para aprender pois teve partes que tive que recorrer ao stackoverflow e ao chatGPT.
![CRUD](https://i.imgur.com/ZGJYWkQ.png)

*Instruções de configuração:*
Em ./lib/firebase_options.dart edite:

>     static  const  FirebaseOptions  web = FirebaseOptions(     
>     apiKey: 'XXXXXXXXXXXXXXXXXXXXXX',    
>     appId: 'XXXXXXXXXXXXXXXXXXXXXX', 
>     messagingSenderId: 'XXXXXXXXXXXXXXXXXXXXXX',     
>     projectId: 'XXXXXXXXXXXXXXXXXXXXXX',     
>     authDomain: 'XXXXXXXXXXXXXXXXXXXXXX',     
>     storageBucket: 'XXXXXXXXXXXXXXXXXXXXXX',     
>     measurementId: 'XXXXXXXXXXXXXXXXXXXXXX',     
>     );
>     
>    static  const  FirebaseOptions  windows = FirebaseOptions(      
>         apiKey: 'XXXXXXXXXXXXXXXXXXXXXX',         
>         appId: 'XXXXXXXXXXXXXXXXXXXXXX',         
>         messagingSenderId: 'XXXXXXXXXXXXXXXXXXXXXX',         
>         projectId: 'XXXXXXXXXXXXXXXXXXXXXX',        
>         authDomain: 'XXXXXXXXXXXXXXXXXXXXXX',         
>         storageBucket: 'XXXXXXXXXXXXXXXXXXXXXX',         
>         measurementId: 'XXXXXXXXXXXXXXXXXXXXXX',        
>         );
> 

Para os dados do seu projeto no firebase.
Ou simplesmente use no terminal:

    flutterfire configure --project=SEU_PROJETO

> Pode ver mais imagens [Aqui](https://imgur.com/a/Xl7rBZg).

