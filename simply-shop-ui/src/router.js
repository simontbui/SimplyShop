import { createBrowserRouter } from "react-router-dom";
import UploadImgForm from "./components/img-upload/UploadImgForm";
import { ProductSubmissionForm } from "./components/img-upload/ProductSubmissionForm";
import { HomePage } from "./components/item-analytics/HomePage";
import { SearchResultPage } from "./components/item-analytics/SearchResultPage";
import Login from "./components/login/Login";
import { Register } from "./components/login/Register";
import App from "./App";

export const router = createBrowserRouter([
    {
        path: "/",
        element: <App />,
        children: [
            { index: true, element: <HomePage /> },
            { path: "item-input", element: <UploadImgForm /> },
            { path: "item-submission", element: <ProductSubmissionForm /> },
            { path: "search-results/:item", element: <SearchResultPage /> },
            { path: "login", element: <Login /> },
            { path: "register", element: <Register /> },
        ],
    },
]);