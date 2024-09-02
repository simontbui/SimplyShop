import axios from "axios";

//http for docker. TODO: use .env
axios.defaults.baseURL = "http://localhost:7073/api/HomeAnalytics"

const responseBody = (response) => response.data

export const getAvgSpentPerVisit = async () => {
    try {
        const data = await axios.get("average-spent/")
        console.log("SUCCESS!=====")
        return responseBody(data)
    }
    catch (e) {
        console.log("FAIL!!========")
        console.log(e.message)
    }
}