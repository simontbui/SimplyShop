import axios from "axios";

//http for docker. TODO: use .env
export const authApi = axios.create({
    baseURL: "http://localhost:7073/api/auth/",
    withCredentials: true
});

let _accessToken = null;

export const setAccessToken = (token) => {
    _accessToken = token;
};

export const getAccessToken = () => {
    return _accessToken;
};

export const clearAccessToken = () => {
    _accessToken = null;
};

authApi.interceptors.request.use((config) => {
    if (_accessToken) {
        config.headers = config.headers ?? {};
        config.headers.Authorization = `Bearer ${_accessToken}`;
    }
    return config;
})
const responseBody = (response) => response.data;

export const registerUser = async (registerForm) => {
    const postData = {
        FirstName: registerForm.firstName,
        LastName: registerForm.lastName,
        Email: registerForm.email,
        Password: registerForm.password
    }

    try {
        const response = await authApi.post("register", postData);
        setAccessToken(response.data.accessToken ?? response.data.AccessToken);
        return responseBody(response);
    } catch (e) {
        console.log(e.message);
    }
};

export const loginUser = async (email, password) => {
    try {
        const response = await authApi.post("login", { email, password });
        if (!response.data?.accessToken) {
            throw new Error("Login response missing access token");
        }
        
        setAccessToken(response.data.accessToken ?? response.data.AccessToken);
        return responseBody(response);
    } catch (e) {
        console.error("Login failed:", e.response?.data ?? e.message);
        throw e;
    }
};

export const whoAmI = async () => {
    try {
        const response = await authApi.get("whoami");
        return responseBody(response);
    } catch (e) {
        console.error("Failed to verify identity:", e.response?.data ?? e.message);
        throw e;
    }
};

export const refresh = async () => {
    console.log("refresh() called");
    try {
        const response = await authApi.post("refresh", null);
        setAccessToken(response.data.accessToken ?? response.data.AccessToken);        
        console.log("REFRESHING....")
        return responseBody(response);
    } catch (e) {
        console.error("Failed to verify identity:", e.response?.data ?? e.message);
        throw e;
    }
};

export const bootstrapAuth = async () => {
    await refresh();
    return await whoAmI();
};