const bindSearchForm = () => {
  const form = document.getElementById("tag-search")

  if (form) {
    form.addEventListener('ajax:beforeSend', function (event) {
      const detail = event.detail,
            xhr = detail[0], options = detail[1];
      Turbolinks.visit(options.url);
      event.preventDefault();
    });
  }
}

export { bindSearchForm }
