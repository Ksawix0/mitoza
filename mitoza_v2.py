import time
import subprocess
import sys
import random
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *

app = QApplication(sys.argv)

class mainwindow(QMainWindow):
    def __init__(self):
        super().__init__()
        
        self.mainwindow()
        
    def mainwindow(self):    
        print(sys.argv)
        
        self.setWindowTitle("Mitoza")
        self.setGeometry(random.randint(100,1000),random.randint(100,850),200,200)
        # self.setMouseTracking(True)
        
        self.font = QFont()
        self.font.setBold(True)
        self.font.setPointSize(50)
        
        self.button = QPushButton("help",self)
        self.button.setText("mitoza")
        self.button.setFont(self.font)
        self.button.clicked.connect(self.clicl)
        self.setCentralWidget(self.button)
        
        self.show()
        try: 
            if sys.argv[1] == 'm':
                print("m")
                self.mitoza()
        except:
            pass
        
    def mitoza(self):
        while False:
            a = subprocess.Popen(['python.exe',sys.argv[0],"m"])
            self.show()
            time.sleep(4)

    def clicl(self):
        self.mitoza()
        
    def leaveEvent(self, a0):
        self.mitoza()
            
    def hideEvent(self, a0):
        self.mitoza()
        
    def closeEvent(self, a0):
        self.mitoza()
        
    # def moveEvent(self, a0):
    #     self.mitoza()
        
    # def moveEvent(self, a0):
    #     self.mitoza()

    # def on_focusChanged(self, old, now):
    #     print("foc")
    #     if now == None:
    #         pass
    #     else: 
    #         if sys.argv[1] == 'f':
    #             print("f")
    #             while True:
    #                 a = subprocess.Popen(['python.exe',sys.argv[0],"m"])
    #                 self.show()
    #                 time.sleep(4)

if __name__ == "__main__":
    window = mainwindow()
    app.exec()