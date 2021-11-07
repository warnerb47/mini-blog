
from PySide6.QtCore import QObject, Slot, Signal

from services.services import login


# Main Window Class
class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

    # Static Info
    staticUser = "admin"
    staticPass = "admin"

    # Signals To Send Data
    signalUser = Signal(str)
    signalPass = Signal(str)
    signalLogin = Signal(bool)

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
            self.signalLogin.emit(True)
            print("Login passed!")



