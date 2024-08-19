import re

def get_dollar_amounts(text):
    regex = "\d*\.\d{2}"
    return re.findall(regex, text)