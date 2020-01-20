function isSame() {
    if (document.getElementById('pw').value !== '' &&
        document.getElementById('pwCheck').value !== '') {
        if (document.getElementById('pw').value === document.getElementById('pwCheck').value) {
            document.getElementById('same').innerHTML = '비밀번호가 일치합니다.';
            document.getElementById('same').style.color = 'blue';
        } else {
            document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
            document.getElementById('same').style.color = 'red';
        }
    } else {
        document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
        document.getElementById('same').style.color = 'red';
    }
}

window.onload = function () {
    var join = document.getElementById('join');
    join.onclick = function () {
        if (document.getElementById('name').value === '') {
            alert('이름을 입력해주세요.');
        } else if (document.getElementById('username').value === '') {
            alert('아이디를 입력해주세요.');
        } else if (document.getElementById('pw').value === '' ||
            document.getElementById('pwCheck').value === '') {
            alert('비밀번호를 입력해주세요,');
        } else if (document.getElementById('pw').value !== document.getElementById('pwCheck').value) {
            alert('비밀번호와 재확인 비밀번호가 다릅니다. 다시 입럭해주세요.');
        } else {
            document.getElementById('joinform').submit();
        }
    }
};