#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Feb  8 18:02:57 2019

@author: travisbarton
"""

from Documents.Reddit_instance import reddit
import numpy as np
import pandas as pd
import re
subs = ["ProRevenge", "gunporn", "FlashTV", "awwwtf", "wellworn", 
        "AnimalTextGifs", "iamverybadass", "shittyrobots", "mildlypenis", 
        "wtfstockphotos", "gamephysics", "wellthatsucks", "wiiu", 
        "conservative", "thesimpsons", "GrandtheftautoV", "hiking", 
        "justfuckmyshitup", "pixelart", "ineeeedit", 
        "Warframe", "keto", "grilledcheese", "motorcycles", 
        "scottishpeopletwitter", "Discordapp", "lotr", "cscareerquestions", 
        "animalsbeingbros", "dogberg"]
dat = pd.DataFrame(columns = ["title", "sub"])
for sub in subs:
    for post in reddit.subreddit(sub).top('all', limit = 1000):
        title = post.title
        if title[0] == '[':
            title = re.sub("[\(\[].*?[\)\]]", "", title)
        dat = dat.append({'title':post.title, 'sub':sub}, ignore_index = True)
        
for i in range(dat.shape[0]):
    dat.iloc[i, 0] = re.sub("[\(\[].*?[\)\]]", "", dat.iloc[i, 0])
    
    
    
''' 
items to Change:
    remove r/
    convert emojis 
    identify Proper nouns

'''

    
    
    
    
    