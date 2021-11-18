
from PySide6.QtCore import QObject, Slot, Signal
from services.services import deleteUser, fetchUsers, postUser, patchUser, login



# Main Window Class
class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

    token =''

    # Signals To Send Data
    signalLogin = Signal(bool)
    signalUpdate = Signal(bool)
    signalDelete = Signal(bool)
    signalPost = Signal(bool)
    signalUsers = Signal(list)

    # Function To Check Login
    @Slot(str, str)
    def checkLogin(self, getUser, getPass):
        token = login(getUser, getPass)
        if(
            not token or
            token == 'cet utilisateur est introuvable' or
            token == 'format invalide' or
            token == 'impossible de créer le token'

        ):
            self.signalLogin.emit(False)
            print("Login error!")
        else:
            self.token = token
            self.signalLogin.emit(True)
            print("Login passed!")

    @Slot()
    def getUsers(self):
        users = fetchUsers(self.token)
        if(
            not users or
            users == 'cet utilisateur est introuvable' or
            users == 'format invalide' or
            users == 'impossible de créer le token'
        ):
            self.signalUsers.emit([])
        else:
            self.signalUsers.emit(users)

    @Slot(str, str, str, str)
    def updateUser(self, getId, getLogin, getPassword, getName):
        update = patchUser(self.token, getId, getLogin, getPassword, getName)
        if(update == 'utilisateur modifier'):
            self.signalUpdate.emit(True)
        else:
            self.signalUpdate.emit(False)

    @Slot(str)
    def removeUser(self, getId):
        update = deleteUser(self.token, getId)
        if(update == 'utilisateur supprimé'):
            self.signalDelete.emit(True)
        else:
            self.signalDelete.emit(False)

    @Slot(str, str, str)
    def createUser(self, getLogin, getPassword, getName):
        post = postUser(self.token, getLogin, getPassword, getName)
        if(
            not post or
            post == 'cet utilisateur est introuvable' or
            post == 'format invalide' or
            post == 'impossible de créer le token'
        ):
            self.signalPost.emit(False)
        else:
            self.signalPost.emit(True)




