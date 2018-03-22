package groovy.controller

import com.cognizant.codeblue.Immersion.controller.WelcomeController
import spock.lang.Specification

class WelcomeControllerSpec extends Specification{

    private WelcomeController controller = new WelcomeController();

    def "check welcome message" (){
        given:"The api/welcome end point is called"
        def welcomeMsg = "";

        when:"when the welcomeToPALImmersion is executed"
        welcomeMsg = controller.welcomeToPALImmersion();

        then:"It should return the welcome message"
        welcomeMsg == "Welcome to CodeBlue Immersion Lab."
    }
}
