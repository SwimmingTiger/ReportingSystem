using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Param
{
    /// <summary>
    /// 报表参数管理
    /// </summary>
    public class ReportParam
    {
        /// <summary>
        /// 参数类型
        /// </summary>
        public enum Type {
            /// <summary>
            /// 地市
            /// </summary>
            CITY = 0,

            /// <summary>
            /// 产品
            /// </summary>
            PRODUCT = 1,

            /// <summary>
            /// 出账收入类型
            /// </summary>
            ACCOUNT = 2,

            /// <summary>
            /// 销账类型
            /// </summary>
            RECONCILIATION = 3,

            /// <summary>
            /// 通知单收入类型
            /// </summary>
            NOTICE_LETTER = 4,

            /// <summary>
            /// 收款用途
            /// </summary>
            PAYMENT_PURPOSE = 5,

            /// <summary>
            /// 结算运营商
            /// </summary>
            OPERATOR = 6,

            /// <summary>
            /// 结算类型
            /// </summary>
            SEETLEMENT_TYPE = 7,
        };

        public static readonly Dictionary<int, string> TypeNames = new Dictionary<int, string> {
                {(int)Type.CITY, "地市编码" },
                {(int)Type.PRODUCT, "产品编码" },
                {(int)Type.ACCOUNT, "出账收入类型编码" },
                {(int)Type.RECONCILIATION, "销账类型编码" },
                {(int)Type.NOTICE_LETTER, "通知单收入类型编码" },
                {(int)Type.PAYMENT_PURPOSE, "收款用途编码" },
                {(int)Type.OPERATOR, "结算运营商编码" },
                {(int)Type.SEETLEMENT_TYPE, "结算类型编码" },
        };

        /// <summary>
        /// 标志字段定义
        /// </summary>
        public class Flag {
            /// <summary>
            /// 产品标志字段
            /// </summary>
            public class Product {
                /// <summary>
                /// 是否使用
                /// </summary>
                public const int USE = 1; // 1
                /// <summary>
                /// 是否出账收入
                /// </summary>
                public const int ACCOUNT = 1 << 1; // 2
                /// <summary>
                /// 是否卡销售
                /// </summary>
                public const int SALE = 1 << 2; // 4
                /// <summary>
                /// 是否网间结算
                /// </summary>
                public const int SETTLEMENT = 1 << 3; // 8
                /// <summary>
                /// 是否预存转收入
                /// </summary>
                public const int PRESTORE = 1 << 4; // 16
                /// <summary>
                /// 是否通知单
                /// </summary>
                public const int NOTICE = 1 << 5; // 32
            }
        }

        public enum Relation {
            /// <summary>
            /// 产品-出账对应关系
            /// </summary>
            PRODUCT_ACCOUNT = 0,

            /// <summary>
            /// 产品-通知单对应关系
            /// </summary>
            PRODUCT_NOTICE = 1,
        };
    }
}