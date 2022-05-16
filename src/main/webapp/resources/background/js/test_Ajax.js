(() => {
    document.querySelector('button').addEventListener('click', () => {
        const url = 'test';
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                // ↓↓↓ 請求本體(Request Body) ↓↓↓
                username: 'st9360606@gmail.com',
                password: 'password'
            })
        });
    });
})();



$(function () {
    $('#btn_modal').click(function () {
        var adminID = $('input[name=adminID]').val();
        console.log(adminID);  //ID是2
        if (adminID != null) {
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/adminServlet",
                data: {
                    "action": "getOne_For_Display",
                    "adminID": adminID,
                },
                cache: false,
                dataType: "json",
                success: function (data) {
                    $('#email').html(data.account);
                    $('#password').attr('value', data.password);
                    $('#name').attr('value', data.name);
                    $('#personImg').attr('value', data.personImg);
                    $('#adminIDHidden').attr('value', data.adminID);
                    $('#account').attr('value', data.account);

                },
                error: onError
            });
        }
    });

    function onError(xhr, ajaxOptions, thrownError) {
        alert("資料有誤，請重新輸入！");
    }

});






function onAdminSubmit() {
    const email = document.querySelector('#email').value;
    const password = document.querySelector('#password').value;
    const name = document.querySelector('#name').value;
    const status = $("input[name='status']:checked").val();

    const choice = [];
    $('input[name="choice"]:checked').each(function () {
        choice.push(this.value);
    });

    const fr = new FileReader();
    fr.onload = e => {
        const fileBase64Str = btoa(e.target.result);
        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/test",
            contentType: 'application/json',
            data: {
                account: email,
                password,
                name,
                file: fileBase64Str,
                accStatus: status,
                choice
            },
            cache: false,
            dataType: "json",
            success: function (data) {
                alert(data);
            },
            error: onError
        });
    }
    function onError(xhr, ajaxOptions, thrownError) {
        alert("資料有誤，請重新輸入！");
    }
};


function onAdminSubmit() {
    const email = document.querySelector('#email').value;
    const password = document.querySelector('#password').value;
    const name = document.querySelector('#name').value;
    const status = $("input[name='status']:checked").val();

    const choice = [];
    $('input[name="choice"]:checked').each(function () {
      choice.push(this.value);
    });

    const fr = new FileReader();
    fr.onload = e => {
      const fileBase64Str = btoa(e.target.result);
      fetch('test', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          account: email,
          password,
          name,
          file: fileBase64Str,
          accStatus: status,
          choice
        })
      })
        .then(resp => resp.json())
        .then(body => alert('xxx'));

    };
    fr.readAsBinaryString(document.querySelector('#file').files[0]);
  }





