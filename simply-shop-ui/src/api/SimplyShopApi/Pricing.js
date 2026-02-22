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
        const data = await pricingApi.get(`historical?itemName=${itemName}&lookBackDays=365`);
        return responseBody(data);
    }
    catch (e) {
        console.log(e.message);
    }
};

export const getStoreCosts = async (itemName) => {
    try {
        const data = await pricingApi.get(`stores/cheapest?itemName=${itemName}&lookBackDays=365`);
        return responseBody(data);
    }
    catch (e) {
        console.log(e.message);
    }
};