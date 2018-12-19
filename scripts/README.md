Google Form Creation by using Google App Script and POST request.
# *Steps to deploy*

 1. Go to Go to [Google App Script](https://script.google.com/).
 2. Create a new Script.
 3. Copy and Paste contents of [Git](https://github.com/preetjdp/gdgmadevents/blob/master/scripts/googleFormScript.gs)
 4. Run function
 5. Publish ⇒ Deploy as web app and set access to be anonymous. 

# Required Parameters

***Json Object to be passed in the body of the post request***

    {
    "title": "GDG MAD Feb",
    "talks": [
        {
            "title": "RxJava - Intro and Beyond",
            "speaker": "Jitesh"
        },
        {
            "title": "DApps - Intro and Beyond",
            "speaker": "Preet"
        },
        {
            "title": "Flutter - ...",
            "speaker": "XYZ!"
        }
    ]
    }
    

***Response Sample***

    {
    "status": "The Form Has Been Successfully Published",
    "url": "https://docs.google.com/forms/d/e/1FAIpQLSfMb5uqzxOjrzacVlVJAUDX2I6HEZ-pE7BA6nKFc1viUd08OQ/viewform",
    "edit_url": "https://docs.google.com/forms/d/1B3zOLeQ2dRBJsNCtFYMy0YjriOR-lWJ1dJOOeVpqdSc/edit"
    }

