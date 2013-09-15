$(function () {

    //Удаление фотографий в альбоме
    var photo = $(".delete_photo");


    // Стандарный input для файлов
    var fileInput = $('.file_input');

    // ul-список, содержащий миниатюрки выбранных файлов
    var imgList = $('ul.img-list');

    var albumImages = $(".album_images");


    fileInput.on('change', function () {
        displayFiles(this.files);
    });

    function displayFiles(files) {
        $.each(files, function (i, file) {
            if (!file.type.match(/image.*/)) {
                // Отсеиваем не картинки
                return true;
            }
            // Создаем элемент li и помещаем в него название, миниатюру и progress bar,
            // а также создаем ему свойство file, куда помещаем объект File (при загрузке понадобится)
            var li = $('<li/>').appendTo(imgList);
            $('<div/>').text(file.name).appendTo(li);
            var img = $('<img/>').appendTo(li);
            $('<div/>').addClass('progress').text('0%').appendTo(li);
            li.get(0).file = file;

            // Создаем объект FileReader и по завершении чтения файла, отображаем миниатюру и обновляем
            // инфу обо всех файлах
            var reader = new FileReader();
            reader.onload = (function (aImg) {
                return function (e) {
                    aImg.attr('src', e.target.result);
                    aImg.attr('width', 150);
                    /* ... обновляем инфу о выбранных файлах ... */
                };
            })(img);

            reader.readAsDataURL(file);
        });
    }

    var uploaderObject = function (params) {

        if (!params.file || !params.url) {
            return false;
        }

        this.xhr = new XMLHttpRequest();
        this.reader = new FileReader();

        this.progress = 0;
        this.uploaded = false;
        this.successful = false;
        this.lastError = false;

        var self = this;

        self.reader.onload = function () {
            self.xhr.upload.addEventListener("progress", function (e) {
                if (e.lengthComputable) {
                    self.progress = (e.loaded * 100) / e.total;
                    if (params.onprogress instanceof Function) {
                        params.onprogress.call(self, Math.round(self.progress));
                    }
                }
            }, false);

            self.xhr.upload.addEventListener("load", function () {
                self.progress = 100;
                self.uploaded = true;
            }, false);

            self.xhr.upload.addEventListener("error", function () {
                self.lastError = {
                    code: 1,
                    text: 'Error uploading on server'
                };
            }, false);

            self.xhr.onreadystatechange = function () {
                var callbackDefined = params.oncomplete instanceof Function;
                if (this.readyState == 4) {
                    if (this.status == 201) {
                        if (!self.uploaded) {
                            if (callbackDefined) {
                                params.oncomplete.call(self, false);
                            }
                        } else {
                            self.successful = true;
                            if (callbackDefined) {
                                params.oncomplete.call(self, true, this.responseText);
                            }
                        }
                    } else {
                        self.lastError = {
                            code: this.status,
                            text: 'HTTP response code is not OK (' + this.status + ')'
                        };
                        if (callbackDefined) {
                            params.oncomplete.call(self, false);
                        }
                    }
                }
            };


            self.xhr.open("POST", params.url);
            var boundary = "xxxxxxxxx";
            // Устанавливаем заголовки
            self.xhr.setRequestHeader("Content-Type", "multipart/form-data, boundary=" + boundary);
            self.xhr.setRequestHeader("Cache-Control", "no-cache");
            // Формируем тело запроса
            var body = "--" + boundary + "\r\n";
            body += "Content-Disposition: form-data; name=file; filename=" + params.file.name + "\r\n";
            body += "Content-Type: application/octet-stream\r\n\r\n";
            body += self.reader.result + "\r\n";
            body += "--" + boundary + "--";

            if (self.xhr.sendAsBinary) {
                // firefox
                self.xhr.sendAsBinary(body);
            } else {
                // chrome (W3C spec.)
                self.xhr.send(body);
            }

        };

        self.reader.readAsBinaryString(params.file);
    };

    function updateProgress(bar, value) {
        var width = bar.width();
        var bgrValue = -width + (value * (width / 100));
        bar.attr('rel', value).css('width', value + '%').text(value + '%');
    }

    $(".upload-all").click(function () {

        UploadStart()

        function UploadStart() {
            imgList.find('li').each(function () {

                var uploadItem = this;
                var pBar = $(uploadItem).find('.progress');
                var url_upload = $('.upload_photo').data('action');

                new uploaderObject({
                    file: uploadItem.file,
                    url: url_upload,

                    onprogress: function (percents) {
                        updateProgress(pBar, percents);
                    },

                    oncomplete: function (done, data) {
                        if (done) {
                            updateProgress(pBar, 100);
                            uploadItem.remove();
                            albumImages.append("<div class='album_photo'><img src='" + data + "'></div>");
                            UploadStart();
                        } else {
                        }
                    }
                });
                return false;
            });
        }
    });


});