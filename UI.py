#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov 26 19:30:05 2018

@author: travisbarton
"""

import pandas as pd
from tkinter import *
import numpy as npa


test = pd.DataFrame(columns = ["id", 'sent', "O1", "O2", "O3", "O4"])

for i in range(5):
    test.loc[i,:] = [i,"this is test "+ str(i), .2, .5, .1, .1]
    
levels = [["Baby"], ["Dinos"], ["bad"], ["Spoons"]]


def Window_maker(sent, choices):
    root = Tk()
    topFrame = Frame(root)
    topFrame.pack()
    botFrame = Frame(root)
    botFrame.pack()
    
    label = Label(topFrame, text =sent)
    label.pack()
    
    button1 = Button(botFrame, text = choices[0])
    button1.pack()
    button2 = Button(botFrame, text = choices[1])
    button2.pack()
    root.mainloop()

def get_params(data):
    index = data.argsort()[-2:]
    return(index)


for i in range(test.shape[0]):
    index = get_params(test.iloc[i, 2:])
    choices = [levels[x] for x in index.values]
    Window_maker(test.iloc[i,1], choices)


