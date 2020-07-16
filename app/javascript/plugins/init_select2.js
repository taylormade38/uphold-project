import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
    $(document).ready(function() {
        if (document.querySelector('#selectofficer')) {
            $('#selectofficer').select2({
                data: JSON.parse(document.getElementById("selectofficer").dataset.officers),
                tags: true
            });
        }
    });
};

export { initSelect2 };
