package com.bookdone.trade.infra.entity;

import com.bookdone.trade.application.TradeStatus;
import lombok.*;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@Table(name = "trade")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@EntityListeners(AuditingEntityListener.class)
public class TradeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "donation_id")
    private Long donationId;

    @Column(name = "member_id")
    private Long memberId;

    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private TradeStatus tradeStatus;

    public void updateStatus(TradeStatus tradeStatus) {
        this.tradeStatus = tradeStatus;
    }

    public void updateId(Long id) {this.id = id;}
}
