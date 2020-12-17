// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

const cookieOK = () => {
  const head = document.querySelector('head');
  head.insertAdjacentHTML("afterbegin", `
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-146085492-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'UA-146085492-1');
    </script>
    `);
}
