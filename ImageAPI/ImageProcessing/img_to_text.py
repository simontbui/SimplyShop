from PIL import Image
import pytesseract
import io
import base64
from ImageProcessing.get_dollar_amounts import get_dollar_amounts

def img_to_text(base64_string):
    """
    str -> list[str]
    """
    pytesseract.pytesseract.tesseract_cmd = "C:\\Program Files\\Tesseract-OCR\\tesseract.exe"

    cleaned_string = base64_string.split("base64,")[-1].strip()
    image_string = io.BytesIO(base64.b64decode(cleaned_string))
    image = Image.open(image_string)

    text = pytesseract.image_to_string(image)
    dollar_amounts = get_dollar_amounts(text)

    return dollar_amounts