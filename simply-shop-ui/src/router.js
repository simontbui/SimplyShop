import { createBrowserRouter } from "react-router-dom";
import UploadImgForm from "./components/img-upload/UploadImgForm";
import { ProductSubmissionForm } from "./components/img-upload/ProductSubmissionForm";
import { HomePage } from "./components/item-analytics/HomePage";
import { SearchResultPage } from "./components/item-analytics/SearchResultPage";

export const router = createBrowserRouter([
    {
        path: "/",
        element: <HomePage />
    },
    {
        path: "/item-input",
        element: <UploadImgForm />
    },
    {
        path: "/item-submission",
        element: <ProductSubmissionForm />
    },
    {
        path: "/search-results", //should have item name in URL
        element: <SearchResultPage />
    }
])