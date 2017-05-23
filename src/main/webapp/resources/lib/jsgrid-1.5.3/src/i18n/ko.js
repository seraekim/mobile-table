(function(jsGrid) {

    jsGrid.locales.ko = {
        grid: {
            noDataContent: "데이터가 없습니다.",
            deleteConfirm: "지우시겠습니까?",
            pagerFormat: "페이지: {first} {prev} {pages} {next} {last} &nbsp;&nbsp; 【 {pageIndex} / {pageCount} 】",
            pagePrevText: "<",
            pageNextText: ">",
            pageFirstText: "<<",
            pageLastText: ">>",
            loadMessage: "로딩 중...",
            invalidMessage: "올바른 형식의 데이터가 아닙니다."
        },

        loadIndicator: {
            message: "로딩 중..."
        },

        fields: {
            control: {
                searchModeButtonTooltip: "조회모드로",
                insertModeButtonTooltip: "삽입모드로",
                editButtonTooltip: "수정",
                deleteButtonTooltip: "삭제",
                searchButtonTooltip: "조회",
                clearFilterButtonTooltip: "필터 초기화",
                insertButtonTooltip: "삽입하기",
                updateButtonTooltip: "수정하기",
                cancelEditButtonTooltip: "수정취소"
            }
        },

        validators: {
            required: { message: "필드값이 요구됩니다." },
            rangeLength: { message: "필드값의 길이가 범위를 벗어납니다." },
            minLength: { message: "필드값이 너무 짧습니다." },
            maxLength: { message: "필드값이 너무 깁니다." },
            pattern: { message: "필드값의 패턴이 일치하지 않습니다." },
            range: { message: "필드값이 정해진 범위를 벗어납니다." },
            min: { message: "필드값이 너무 작습니다." },
            max: { message: "필드값이 너무 깁니다." }
        }
    };

}(jsGrid, jQuery));

