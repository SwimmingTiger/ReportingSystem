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
            CASH_RECONCILIATION = 3,

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
        }
    }
}