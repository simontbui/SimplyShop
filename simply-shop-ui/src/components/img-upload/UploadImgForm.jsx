import { MuiFileInput } from "mui-file-input";
import { useState } from "react";
import AttachFileIcon from '@mui/icons-material/AttachFile'
import TopNav from "../common/TopNav";
import { Button, Container, CssBaseline, Grid, Paper, Typography, styled } from "@mui/material";
import { useNavigate } from "react-router-dom";

const UploadImgForm = () => {
    const navigate = useNavigate();
    const [imgFile, setImgFile] = useState(null);
    const getBase64 = (file) => {
        return new Promise(resolve => {
            let fileInfo;
            let baseURL = "";
            let reader = new FileReader();

            reader.readAsDataURL(file);

            reader.onload = () => {
                console.log("Called", reader);
                baseURL = reader.result;
                console.log(baseURL);
                resolve(baseURL);
            };
            console.log(fileInfo);
        })
    }

    const handleSubmitImg = (newValue) => {
        //CONVERT BASE64 IMG TO API
    }

    const handleImgChange = (imgFile) => {
        setImgFile(imgFile)
    }

    return (
        <>
            <CssBaseline />
            <TopNav />
            <Container>
                <Paper elevation={3} sx={{ py: 1, px: 5 }}>
                    <Typography
                        variant="h3"
                        color="textPrimary"
                        sx={{ my: 4, textAlign: "center"}}
                    >
                        Upload an image of your grocery receipt below. 
                    </Typography>
                    <Typography
                        color="textSecondary"
                    >
                        By uploading your receipt image, the site will extract out all the dollar amounts from your receipt. All that's left to do is for you to name the item for each value. For best results, crop your image to only show the groceries and their prices! By providing accurate results, your contributions will allow for a smarter and cheaper grocery shopping experience for all. Thank you!
                    </Typography>
                    <Grid container direction="row" sx={{ py: 2 }} spacing={2}>
                        <Grid item>
                            <MuiFileInput
                                placeholder="Insert your receipt image"
                                InputProps={{
                                    inputProps: {
                                        accept: "image/*",
                                    },
                                    startAdornment: <AttachFileIcon />
                                }}
                                value={imgFile}
                                onChange={handleImgChange}
                                sx={{ minWidth: 350, height: 55 }}
                            />
                        </Grid>
                        <Grid item alignItems="stretch">
                            <Button 
                                variant="outlined" 
                                sx={{ minWidth: 350, height: 55 }}
                                onClick={() => navigate("/item-submission")}
                            >
                                Manually log your receipt items.
                            </Button>
                        </Grid>
                    </Grid>
                </Paper>
            </Container>
        </>
    )
};

export default UploadImgForm;