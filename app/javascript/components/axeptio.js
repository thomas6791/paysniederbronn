const axeptio = () => {
  console.log("axeptio");
function launchGA() {
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
    ga('create', 'UA-146085492-1', 'auto');
    ga('send', 'pageview');
  }

  void 0 === window._axcb && (window._axcb = []);
  window._axcb.push(function(axeptio) {
    axeptio.on("cookies:complete", function(choices) {
      if(choices.google_analytics) {
        launchGA();
      }
    })
  });
}
export { axeptio };
