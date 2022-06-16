from rest_framework import HTTP_HEADER_ENCODING, exceptions
from rest_framework.authtoken.models import Token

def get_authorization_header(request):

    auth = request.META.get('HTTP_AUTHORIZATION', b'')
    if isinstance(auth, int):
        # Work around django test client oddness
        auth = auth.encode(HTTP_HEADER_ENCODING)
    return auth

class BaseAuthentication:
    def authenticate(self, request):
        raise NotImplementedError(".authenticate() must be overridden.")
    def authenticate_header(self, request):
        pass


class TokenAuthentication(BaseAuthentication):
    def authenticate(self, request):
        auth = get_authorization_header(request).split()
        # if not auth :
        #     return self.authenticate_credentials(None)
        if not auth or auth[0].lower() == b'token':
            msg = 'Invalid token header. No credentials provided.'
            raise exceptions.AuthenticationFailed({'status':bool(False),"message":msg})
 
        if len(auth) != 1:
            msg = 'Invalid token header. No credentials provided.'
            raise exceptions.AuthenticationFailed({'status':bool(False),"message":msg})
        elif len(auth) > 2:
            msg = 'Invalid token header. Token string should not contain spaces.'
            raise exceptions.AuthenticationFailed({'status':bool(False),"message":msg})

        return self.authenticate_credentials(auth[0])
    def authenticate_credentials(self, key):
        model = Token 
        try:
            token = model.objects.select_related('user').get(key=key)
        except model.DoesNotExist:
            raise exceptions.AuthenticationFailed({'status':False,"message":('Invalid token.')})
        if not token.user.is_active:
            raise exceptions.AuthenticationFailed({'status':False,'message':('User inactive or deleted.')})
        return (token.user, token)


        

class GuestAuthentication(BaseAuthentication):
    def authenticate(self, request):
        auth = get_authorization_header(request).split()
        if not auth :
            return self.authenticate_credentials(None)
        return self.authenticate_credentials(auth[0])

    def authenticate_credentials(self, key):
        model = Token 
        try:
            token = model.objects.select_related('user').get(key=key)
        except model.DoesNotExist:
            return None
        return (token.user, token)