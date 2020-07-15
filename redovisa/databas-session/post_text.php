
            <h1>Post form with text</h1>

            <form method="post" action="?page=process_redirect">
                <fieldset>
                    <label>A form using Post and text input with redirect</label>
                    <p>
                        <label for="message">Text:</label>
                        <textarea name="message"></textarea>
                    </p>
                    <p>
                        <input type="submit" value="Submit">
                        <input type="reset" value="Reset">
                    </p>
                </fieldset>
            </form>

            <div class="<?=messageCheck("message", "success")?>">
                <h1>Thank you!</h1>
                <p>Your text message was<br> "<?=textMessage()?>"</p>
            </div>
            <?=$_SESSION["message"] = null?>
