from flask import Flask
from flask_restx import Resource, Api, fields
from werkzeug.middleware.proxy_fix import ProxyFix
from werkzeug.exceptions import BadRequest
from ImageProcessing.img_to_text import img_to_text

app = Flask(__name__)
app.wsgi_app = ProxyFix(app.wsgi_app)
api = Api(app, version="1.0", title="ImageAPI", description="Receipt Image OCR")

ns = api.namespace("Receipt", description="Receipt Image Extraction")

@ns.route("/")
class Receipt(Resource):
    @ns.doc("get dollar amounts from receipt")
    @ns.expect(api.model("ReceiptString", {
        "imageString": fields.String
    }))
    @ns.marshal_list_with(api.model("AmountsArray", {
        "amounts": fields.List(fields.Float)
    }))
    def post(self):
        '''Extracts dollar amounts from a receipt image'''
        try:
            amounts = img_to_text(api.payload["imageString"])
        except:
            raise BadRequest("Invalid Base64 string or other issue.")
        
        return {"amounts": amounts}

if __name__ == "__main__":
    app.run(debug=True)