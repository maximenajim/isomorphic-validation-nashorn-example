function isValidPassword(password){
    var score = scorePasswordStrength(password);
    return score >= 2;
}

function scorePasswordStrength(password){
    var score   = 0;

    if (password) {
        if (password.length > 6) score++;

        if ((password.match(/[a-z]/)) && (password.match(/[A-Z]/))) score++;

        if (password.match(/\d+/)) score++;

        if (password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/)) score++;

        if (password.length > 12) score++;
    }

    return score;

}