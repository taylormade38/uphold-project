import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
    $(document).ready(function() {
        $('#selectofficer').select2({
            data: JSON.parse(document.getElementById("selectofficer").dataset.officer)

        });
    });
};

export { initSelect2 };
