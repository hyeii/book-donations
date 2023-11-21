<<<<<<< HEAD:backend/donation/src/main/java/com/bookdone/global/response/SuccessResponse.java
package com.bookdone.global.response;
=======
package com.bookdone.global.dto;
>>>>>>> origin/donation:backend/donation/src/main/java/com/bookdone/global/dto/SuccessResponse.java

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SuccessResponse {
    private boolean success;
    private String msg;
    private Object data;
}
