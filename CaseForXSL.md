> # The Case for XSL #


## The Objective ##
> The holy grail for back-end web development for nigh-on a decade has been to leverage the considerable power of XML
> and completely decouple the server application from the vagaries of managing the view. With the display elements out of the way, simple rigorous tests of application output may be more easily
> designed and enforced.  Applications can be written more cleanly and more rapidly, arguable with fewer errors. To achieve this Utopian state of affairs, we must first address the problem of  whatever does deal with the view. The solution comes back every  time: XSLT.  The  XSLT stylesheet allows us to format arbitrary streams of XML into user-consumable documents, such as XHTML, SVG or any of the host of XML-derived formats.

> XSLT is a powerful and well-established mechanism specified by the [W3C](http://www.w3c.org) and implemented by all modern browsers.  It is designed to transform arbitrary XML into other XML forms.  Turning XML data into XHTML is very easily accomplished. Any reasonably competent web developer can, in time, learn to manually produce an	XSLT stylesheet from a given design document in a matter of hours.

## The Pros ##

> Most modern web browsers can apply the transformation locally, distributing the CPU cycles the server would otherwise would have to have spend.  For those clients which are not capable of applying transforms locally, a lightweight transform-proxy may be introduced, and with it, the possibility of dynamically binding the application's data into a larger number of output formats, each best suited to the proxy-client making the request. The application enjoys the luxury of not caring what device we are responding to.  We have already put XML responders and web service frameworks into place to serve those 'pure' data responses to Ajax requests and a host  of proprietary HTTP clients; wouldn't it be nice if we could handle page requests from web browsers with the same simple elegance the web service model provides?

> The current practice of serving fully rendered HTML pages to clients browsers has us serving all the same formatted markup across the network when users are browsing similarly formatted pages, such as message boards, a news feed or a set of profile summaries.  The actual amount of variable data in each of these pages is often quite small compared to the byte-count of the fully  rendered page which we push out again and again. Additionally, our application typically integrates with a template manager to render our application-derived data sets into an HTML stream.

> The templates themselves typically represent fragments of HTML and tend to multiply as more sophisticated screen flows and visual designs are developed. For front-end developers, It can also be difficult if not impossible to simply view them through a standard web browser for visual feedback without putting them though the application process.

> A word about template managers: while we have been using them very effectively for many years to deliver text-based content, the nature of the game has been refined in recent years.  While _insert your favorite template manager here_ is an effective engine/tool for manipulating strings, often in highly imaginative and sophisticated ways, the fact is, we are no longer in the business of  delivering strings.  We are now in the business of delivering Documents, whether XHTML, RSS or arbitrary structured data, it's all W3C-compliant XML.

> Producing Documents with a string manipulation tool is about as effective as bringing a knife to a gun-fight. The templates and HTML fragments become a maintenance and version control challenge unto themselves as they must be maintained with reference to a ever-evolving design document. It certainly can be done and done very effectively; after all, pretty much the entire dynamic web is currently deployed in such a manner. But the  fact remains that such productions can be convoluted and error-prone. A higher-level approach would be welcome.

> For the developer and the architect, adopting an XSLT-based delivery model offers some very attractive features. The application only needs to deliver structured data to the client instead of the fully-formed document. Template manager integration is no longer a necessity.  You are spared the expense of rendering out fully marked-up XHTML to many clients.  Instead, the client uses it's own CPU to produce layout. The page layout, being encapsulated in an XSLT file, needs only to be fetched once by the browser, compiled once and then used repeatedly by the client to render similar pages.  The network is spared the expense of retransmitting the formatting details more than once which can significantly reduce the number of bytes the application needs to transmit. Nearly every modern server-side language or application framework provides elegant, transparent means for transforming application data representations into arbitrary structured XML, suitable for transmission.  The output of your applications may now be rigorously defined much more easily.  Any given application response can be associated with an xml-schema or a DTD.  Continuous integration can leverage the fact and validate application responses with greater accuracy as these tests are now isolated from the effects of constantly evolving visual design changes.

## The Cons ##
> In many ways, XML has  been a boon to distributed application developers in hundreds, if not thousands, of ways.  Conceptually, it is simple, regular, easy to manipulate, powerful in it's expressive capabilities and amply supported by nearly all modern languages. Yet it is not always elegant.  In order to accomplish the most mundane tasks, productions which can be expressed  in a few words or symbols, many lines of application code are often needed. XSLT is a prime example of this. For all of it's expressive power, it is extremely verbose.

> The real challenge of current XSLT deployment strategies is in QA and change management. Design documents are generally produced by naive web designers who, for the most part, are decidedly non-technical. In real-world practice, after the initial stylesheet has been produced (or while it is still in process), change requests begin to pour in. These changes may be small and, with some experience, our intrepid developer is able to edit those changes directly into the work in progress. Inevitably, larger changes will be introduced, possibly causingour stylesheet author to lose place or have to start over.  Data-driven or not, XSLT productions are still very complex and the functional appraoch of the language requires a level of discipline to maintain. Even under the best of circumstances, manual XSLT production is an error-prone process requiring rigorous scrutiny from QA after the fact. This can be frustrating in the face of impatient clients who do not and can not understand why their desire for immediate satisfaction needs to be tempered 'for technical reasons'.

> For the manager of this process, there is another side to the story. Having largely freed the back-end systems from worrying about how any given data  set renders, new services can be developed and tested more rapidly and with greater accuracy engendering potentially reduced costs.  On the other hand, any changes to the pages which end-users will see in their browsers are now bottle-necked by the few resources available who understand XSLT; particularly, those few who are familiar with the specific structures of such stylesheets as have already been deployed.

> ## The Solution ##
> If XSLT production could be simplified, made more accessible and less error-prone, the down-side could be mitigated.  Ideally, if XSLT production could be accomplished as part of a build process that flows directly from the design document, that risk disappears. That is precisely what Dexter  is designed to do.