function initGoogleSignIn(callback) {
    google.accounts.id.initialize({
        client_id: '665449140587-vc803lu63d74cdu3cm9b6pc1pgk0cake.apps.googleusercontent.com',
        callback: function (response) {
            // response.credential adalah idToken
            callback(response.credential);
        }
    });
}

function promptGoogleSignIn() {
    google.accounts.id.prompt();
}

function renderGoogleButton(elementId) {
    google.accounts.id.renderButton(
        document.getElementById(elementId),
        { theme: 'outline', size: 'large', width: '100%' }
    );
}