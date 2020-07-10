const submitForm = (event) => {
    return new Promise((resolve) => {
      const detail = event.detail,
            xhr = detail[0], options = detail[1];
      Turbolinks.visit(options.url);
      event.preventDefault();
      resolve()
    });
};

const bindSearchForm = () => {
  const form = document.getElementById("tag-search")

  if (form) {
    form.addEventListener('ajax:beforeSend', function (event) {
        submitForm(event).then(() => {
            setTimeout(() => {
                console.log('123')
                document.querySelector('.reports-container-tab a').click()
            }, 1000);
        });
    });
  }
}

export { bindSearchForm }
