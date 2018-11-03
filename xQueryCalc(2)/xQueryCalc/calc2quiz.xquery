import schema default element namespace "" at "flashcardhtml.xsd";
import schema namespace q="http://syllabus.cs.manchester.ac.uk/pgt/2017/COMP60411/examples/quiz" at "quiz.xsd";

declare function local:expr2humanReadable($expr) {
    (:Replace this with a function that turns the XML into a nice string:)
    let $x := "3 + 5"
    return $x
};

declare function local:answerFor($expr) {
    (:Replace this with a function that calculates the value of the expression.:)
    let $x := 8
    return $x
};

validate{<html>
    <head>
        <title>{/*/q:title/text()}</title>
        <script type="text/javascript" src="miniformvalidator.js"/>
    </head>
    <body>
        <h1>{/*/q:title/text()}</h1>
        <form>
            <ol>{let $exprs := /*/q:expr, 
                     $count := count($exprs)
                 for $i in (1 to $count)
                 let $expr := $exprs[$i]
                 let $id := concat("q", $i)
                 return <li>{local:expr2humanReadable($expr)}=
                <input type="text" id="{$id}" data-answer="{local:answerFor($expr)}" size="8" /><span><input
                        type="button" onclick="check(document.getElementById('{$id}'))"
                        value="Check answer" /></span>
                </li>}
            </ol>
        </form>

    </body>
</html>}