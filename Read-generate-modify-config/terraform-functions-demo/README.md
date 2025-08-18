This is a demo file for learning terraform functions.
<!-- 
Command:
    - terraform console
    - Tested functions such as: min(), max(), file("path-2-file") over a terminal.

    - lookup({"us-east-1"  = "ami-020cba7c55df1f615", "us-west-2"  = "ami-014e30c8a36252ae5", "ap-south-1" = "ami-0e1d06225679bc1c5"}, "us-east-1")
    - Output for lookup function is : "ami-020cba7c55df1f615"

    - length(["firstec2","secondec2"])
    - Output for the length function is : 2

    - element(["firstec2","secondec2"], 0)
    - Output is: "firstec2"

    - element(["firstec2","secondec2"], 1)
    - Output is: "secondec2"

    - timestamp()
    - Output is: "2025-08-18T09:27:56Z"

    - formatdate("DD MMM YYYY hh:mm ZZZ", "2025-08-18T09:27:56Z")
    - Output is: "18 Aug 2025 09:27 UTC"

    - NOTE: If you have multiple tf files under same folder, make sure to run tf files 1 by 1 by 
            commenting out the other one.
 -->

 **Refrence Docs**

 - https://developer.hashicorp.com/terraform/language/functions/lookup
 - https://developer.hashicorp.com/terraform/language/functions/length
 - https://developer.hashicorp.com/terraform/language/functions/element
 - https://developer.hashicorp.com/terraform/language/functions/timestamp
 - https://developer.hashicorp.com/terraform/language/functions/formatdate