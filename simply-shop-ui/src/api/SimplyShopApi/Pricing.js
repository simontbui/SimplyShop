import axios from "axios";

//http for docker. TODO: use .env
export const pricingApi = axios.create({
    baseURL: "http://localhost:7073/api/Pricing/",
});

const responseBody = (response) => response.data;

export const getAvgSpentPerVisit = async () => {
    try {
        const data = await pricingApi.get("average-visit/");
        return responseBody(data);
    }
    catch (e) {
        console.log(e.message);
    }
};

export const getDailyPricing = async (itemName) => {
    try {
        const data = await pricingApi.get(`daily-pricing?itemName=${itemName}`);
        return responseBody(data);
    }
    catch (e) {
        console.log(e.message);
    }
};